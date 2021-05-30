class Pack < ApplicationRecord
  # 팩 모델에 image컬럼을 첨부할 수 있도록 설정
  has_one_attached :image
end
