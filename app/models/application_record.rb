# ActiveRecordがやっている事はRubyのコードを変換する事
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
