class ClassName < ApplicationRecord
  def other
    @other ||= (ClassName.all - [self]).sample
  end
end
