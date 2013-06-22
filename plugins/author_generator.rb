# encoding: utf-8

module Jekyll

  # The AuthorListIndex class creates a single author page for the specified author.
  class AuthorListIndex < Page

    # Initializes a new AuthorListIndex.
    #
    #  +base+         is the String path to the <source>.
    #  +authors+      is the all authors.
    def initialize(site, base, authors)
      @site = site
      @base = base
      @dir  = site.config['author_dir'] || 'authors';
      @name = 'index.html'

      # authors 集計
      calc = Hash.new();
      site.posts.each do |post|
        next unless post.data.has_key? "author"
        author = post.data['author']
        calc[author] = (calc[author] || 0) + 1
      end

      _authors = []
      calc.each do |name, count|
          _authors.push :name => name,:count => count
      end

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'author_list.html')
      self.data['authors']     = _authors
      self.data['title']       = "All Authors"
      self.data['description'] = "All Authors"
    end

  end
  
  class AuthorIndex < Page

    # Initializes a new AuthorListIndex.
    #
    #  +base+        is the String path to the <source>.
    #  +author+      is the all authors.
    def initialize(site, base, author_key, author)
      @site = site
      @base = base
      @dir  = ( site.config['author_dir'] || 'authors' ) + '/' + author_key;
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'author_index.html')
      self.data['author_key'] = author_key
      self.data['author'] = author
      self.data['title']       = "Author: " + author['name']
      self.data['description'] = "Author: " + author['name']
    end

  end
  
  
  # The Site class is a built-in Jekyll class with access to global site config information.
  class Site
    @authors = {}
    attr_accessor :authors

    # init authors from authors.yml
    def init_authors
      return unless @authors.nil?

      @authors = YAML::load(File.open(File.expand_path('../../author.yml', __FILE__)))
      @authors.each do |key, author| author['posts'] = [] end
      @posts.each do |post|
        next unless post.data.key? 'author'
        next unless @authors.key? post.data['author']
        author = post.data['author']
        @authors[author]['posts'].push post
      end
    end
    
    # Loops through the list of category pages and processes each one.
    def write_author_list
      if self.layouts.key? 'author_list'
        index = AuthorListIndex.new(self, self.source, @authors)
        index.render(self.layouts, site_payload)
        index.write(self.dest)
        # Record the fact that this page has been added, otherwise Site::cleanup will remove it.
        self.pages << index

      # Throw an exception if the layout couldn't be found.
      else
        raise "failed to write author list."
      end
    end
    
    # Loops through the list of category pages and processes each one.
    def write_author_indexes
      @authors.each do |key, author|
          if self.layouts.key? 'author_index'
            index = AuthorIndex.new(self, self.source, key, author)
            index.render(self.layouts, site_payload)
            index.write(self.dest)
            # Record the fact that this page has been added, otherwise Site::cleanup will remove it.
            self.pages << index

          # Throw an exception if the layout couldn't be found.
          else
            raise "failed to write author index."
          end
      end
    end

    def render_author_sidebar_list
      init_authors

      dir = @config['author_dir'] || 'authors'
      cat_limit = @config['author_limit'] || 10
      authors = @authors

      html = ''
      top_authors = authors.sort_by{ |key, value| value['posts'].size }.reverse.take(cat_limit)
      top_authors.each do |author_key, author|
        next if author['posts'].size == 0

        url = config['root'] + dir + '/' + author_key.to_url + '/'
        name = author['name']
        count = author['posts'].count
        html << "<li><a href='#{url}'>#{name} (#{count})</a></li>"
      end
      html
    end

  end
  
  
  # Jekyll hook - the generate method is called by jekyll, and generates all of the category pages.
  class GenerateAuthorList < Generator
    safe true
    priority :low

    def generate(site)
      site.init_authors
      site.write_author_list
      site.write_author_indexes
    end

  end

  module Filters 

      def author_list_link(author)
          site = @context.registers[:site]
          dir = site.config['author_dir'] || 'authors'
          name = author[:name]
          count = author[:count]
          name2 = site.authors.has_key?(name) ? site.authors[name]['name'] : name

          url = "/#{dir}/#{name.to_url}/"
          "<a href='#{url}'>#{name2} (#{count})</a>"
      end

  end
  
  class AuthorSidebarList < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      site = context.registers[:site]
      site.render_author_sidebar_list
    end
  end
  
end

Liquid::Template.register_tag('author_sidebar_list', Jekyll::AuthorSidebarList)

