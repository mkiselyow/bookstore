ActiveAdmin.register Book do

  permit_params do 
    permitted = [:title, :price, :description, :books_in_stock, :author_id, :category_id, :image, image_attributes: [:_destroy], images_attributes: [:_destroy, :id, :image]]
    permitted
  end

  index do
    selectable_column
    id_column
    column :title, sortable: :title
    column 'Thumb' do |firmware|
      if firmware.images && firmware.images.first
        link_to image_tag(firmware.images.first.image.url(:thumb)),
          firmware.images.first.image.url(:original)
      else
        image_tag(firmware.default_image_url(:thumb))
      end
    end
    column :created_at
    actions
  end

  form :html => { :multipart => true } do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.has_many :images,
                 new_record: 'Dowload Image',
                 allow_destroy: true do |b|
        b.input :image, required: true, 
          as: :file, :input_html => {:class => "#{b.object.class}_#{b.object.id}"}, 
          :hint => image_tag(b.object.image.url(:thumb))
      end
    end
    f.actions
  end
end
