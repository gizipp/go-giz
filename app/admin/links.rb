ActiveAdmin.register Link do
  permit_params :url, :slug

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :url, :url_clicked, :slug, :slug_clicked
  #
  # or
  #
  # permit_params do
  #   permitted = [:url, :url_clicked, :slug, :slug_clicked]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs "Link" do
      f.input :url
      f.input :slug
    end
    f.actions
  end

end
