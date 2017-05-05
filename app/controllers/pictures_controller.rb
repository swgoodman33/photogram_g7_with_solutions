class PicturesController < ApplicationController
  def new_form
    render("pic_templates/new_form.html.erb")
  end

  def create_row

    p = Photo.new

    p.caption = params["the_caption"]
    p.source = params["the_source"]
    p.save
    @current_count = Photo.count

    redirect_to("/photos/")
  end

  def index
    @list_of_photos = Photo.all.order(:created_at => :desc)
    render("pic_templates/index.html.erb")
  end

  def show
    # The paramaters look like: {"the_id"=> "4"}

    @my_photo = Photo.find(params["the_id"])

    id_number = params["the_id"]

    p = Photo.find(id_number)

    @the_caption = p.caption
    @the_source = p.source
    @the_timestamp = p.created_at
    render("pic_templates/show.html.erb")
  end

  def edit_form
    @my_photo = Photo.find(params["the_id"])

    render("pic_templates/edit_form.html.erb")
  end

  def update_row
    id_number = params["the_id"]
    p = Photo.find(id_number)
    p.source = params["the_source"]
    p.caption = params["the_caption"]
    p.save

    redirect_to("/photos/#{p.id}")
  end

  def destroy_row
    p = Photo.find(params["the_id"])
    p.destroy

    @current_count = Photo.count

    redirect_to("/photos/")
  end
end
