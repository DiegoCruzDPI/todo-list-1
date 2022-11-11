class ToDosController < ApplicationController
  def index
    matching_to_dos = ToDo.where({:user_id => session.fetch(:user_id)})

    @list_of_to_dos = matching_to_dos.order({ :created_at => :desc })

    render({ :template => "to_dos/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_to_dos = ToDo.where({ :id => the_id })

    @the_to_do = matching_to_dos.at(0)

    render({ :template => "to_dos/show.html.erb" })
  end

  def create
    the_to_do = ToDo.new
    the_to_do.content = params.fetch("query_content")
    the_to_do.user_id = @current_user.id
    the_to_do.status = params.fetch("query_status")

    if the_to_do.valid?
      the_to_do.save
      redirect_to("/", { :notice => "To do created successfully." })
    else
      redirect_to("/", { :alert => the_to_do.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_to_do = ToDo.where({ :id => the_id }).at(0)
    the_to_do.user_id = @current_user.id
    the_to_do.status = params.fetch("query_status")

    if the_to_do.valid?
      the_to_do.save
      redirect_to("/", { :notice => "To do updated successfully."} )
    else
      redirect_to("/", { :alert => the_to_do.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_to_do = ToDo.where({ :id => the_id }).at(0)

    the_to_do.destroy

    redirect_to("/", { :notice => "To do deleted successfully."} )
  end
end
