# encoding: utf-8

module Jekyll

  # The CategoryList class creates a single category page for the specified category.
  class CategoryListIndex < Page

    # Initializes a new CategoryIndex.
    #
    #  +base+         is the String path to the <source>.
    #  +categories+   is the all categories.
    def initialize(site, base, categories)
      @site = site
      @base = base
      @dir  = site.config['category_dir'] || 'categories';
      @name = 'index.html'

      _categories = []
      categories.each do |name, posts|
          _categories.push :name => name,:count => posts.size
      end

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_list.html')
      self.data['categories']  = _categories
      self.data['title']       = "All Categories"
      self.data['description'] = "All Categories"
    end

  end
  
  
  # The Site class is a built-in Jekyll class with access to global site config information.
  class Site

    # Loops through the list of category pages and processes each one.
    def write_category_list
      if self.layouts.key? 'category_list'
        index = CategoryListIndex.new(self, self.source, self.categories)
        index.render(self.layouts, site_payload)
        index.write(self.dest)
        # Record the fact that this page has been added, otherwise Site::cleanup will remove it.
        self.pages << index

      # Throw an exception if the layout couldn't be found.
      else
        raise "failed to write category list."
      end
    end

  end
  
  
  # Jekyll hook - the generate method is called by jekyll, and generates all of the category pages.
  class GenerateCategoriesList < Generator
    safe true
    priority :low

    def generate(site)
      site.write_category_list
    end

  end

  module Filters 

      def category_list_link(category)
          dir = @context.registers[:site].config['category_dir']
          name = category[:name]
          count = category[:count]
          url = "/#{dir}/#{name.to_url}/"
          "<a href='#{url}'>#{name} (#{count})</a>"
      end

  end
  
end

