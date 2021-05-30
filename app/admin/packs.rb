ActiveAdmin.register Pack do
  index do 
    selectable_column

    id_column
    column :image do |pack|
      if pack.image.attached?
        image_tag url_for(pack.image), class: "small_img"
      else 
        "이미지 없음"
      end 
    end 
    column :product_name
    column :company_name
    column :desc 

    actions 
  end 

  # form 페이지 수정 (Rails 에서는 new페이지나 edit 페이지를 똑같이 처리한다. form 이라고 똑같이 부른다.)
  # new 와 edit 를 수정할 수 있는 부분이 form do |f| 부분
  # 컬럼의 데이터 타입에 따라서  active_admin 입력란이 설정된다. 별도로 설정하려면 as: 를 사용한다.
  form do |f|
    f.inputs do
      f.input :image, as: :file
      f.input :product_name
      f.input :company_name
      f.input :desc
    end
    f.actions
  end

  # show 부분 수정하는 부분
  show do 
    attributes_table do
      # 보여주고 싶은 컬럼추가하는 부분
      row :id
      # row image 부분을 pack이라고 지칭해 반복문 수행 (pack 말고도 다른것 사용 가능)
      row :image do |pack|
        # image가 없으면 에러발생 따라서 if 문을 통해서 방지하도록 한다.
        if pack.image.attached?
          image_tag url_for(pack.image), class: "small_img"
        else  
          "이미지 없음"
        end
      end 
      row :product_name
      row :company_name
      row :desc
    end
  end 
end
