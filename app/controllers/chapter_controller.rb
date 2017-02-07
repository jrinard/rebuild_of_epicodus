class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all   # shows all chapters
  end

  def show
    @chapter = Chapter.find(params[:id]) # finds id of a single chapter
  end

  def new
    @chapter = Chapter.new # initialize the chapter model
  end

  def create
    @chapter = Chapter.new(chapter_params) #generates a new chapter object with the parameters returned from the chapter_params method.
    if @chapter.save
      flash[:notice] = "Chapter successfully added!"
      redirect_to chapters_path # redirecting to /chapters
    else
      render :new
    end
  end

  def edit
    @chapter = Chapter.find(params[:id]) #we do NOT need to use strong parameters. We can safely pull the id from the params.
  end

  def update
    @chapter= Chapter.find(params[:id])
    if @chapter.update(chapter_params)
      flash[:notice] = "Chapter successfully updated!"
      redirect_to chapters_path
    else
      render :edit
    end
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    flash[:notice] = "Chapter successfully deleted!"
    redirect_to chapters_path
  end

# needed for create and update - needs to be on bottom
  private #Strong parameters use a private method to permit only designated parameters to be passed for our model. Therefore, any malicious request sent with malicious parameters will not successfully process since the private method can not be accessed.
    def chapter_params
      params.require(:chapter).permit(:name) #example of multiple fields
    end

end
