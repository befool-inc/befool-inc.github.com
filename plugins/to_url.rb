# encoding: utf-8

require 'stringex'

class String

    # to_urlが漢字を中国語読みのローマ字でURL化するので、
    # 単純にURL Encodeで扱うように変更
    def to_url
        CGI.escape self
    end

end

