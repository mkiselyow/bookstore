ActiveAdmin.register Book do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params do 
    permitted = [:title, :price, :description, :books_in_stock, :author_id, :category_id, :image, image_attributes: [:_destroy]]
    permitted
  end

  index do
    selectable_column
    id_column
    column 'Image', sortable: :image_file_name do |firmware| link_to firmware.image_file_name, firmware.image.url end
    column 'Thumb', sortable: :image_file_name do |firmware| link_to image_tag(firmware.image.url(:thumb)), firmware.image.url(:original) end
    column :image_file_size, sortable: :image_file_size do |firmware| "#{firmware.image_file_size / 1024} KB" if firmware.image_file_size end
    # column "Version" do |firmware| "#{firmware.major_version}.#{firmware.minor_version}.#{firmware.patch_version}" end
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs "Upload", :multipart => true do
      f.input :image, id: "pictureInput", required: true, 
        as: :file, :input_html => {:id => "pictureInput"}, 
        :hint => image_tag(f.object.image.url(:thumb))
      if f.object.image.present?
        f.semantic_fields_for :image_attributes do |image_fields|
          image_fields.input :_destroy, as: :boolean, label: 'Delete?'
        end
      end
    div id: 'target' do; end
    end
    f.actions
  end
end
