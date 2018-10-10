class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  #before_action :set_time_entry, only: [:show, :edit, :update, :destroy]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(user: current_user).order('fecha_fin DESC')
    @tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to action: "index", notice: 'Task was successfully updated.' }
        format.json { render :index, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def save_remote
    @task = Task.new(today_params)
    respond_to do |format|
      if @task.save
        format.html {redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
     
      new_params = params.require(:task).permit(:nombre,:duracion,:fecha_inicio, :hora_inicio, :proyect_id)
      new_params[:user_id] = current_user.id
      new_params[:fecha_fin] = fecha_final(new_params)
      new_params
    end 


    def today_params
      new_params = params.require(:task).permit(:nombre,:duracion)
      new_params[:user_id] = current_user.id
      new_params[:nombre] = new_params[:nombre].empty?? "Hoy": new_params[:nombre]
      new_params[:fecha_inicio] = Time.now.strftime("%Y-%m-%d  ")
      new_params[:hora_inicio] = Time.now.strftime("%T")
      new_params[:fecha_fin] = fecha_final(new_params)
      new_params
    end  

    def fecha_final(new_params)
      fecha_string = new_params[:fecha_inicio] + " "+ new_params[:hora_inicio]
      fecha = Time.parse(fecha_string)
      fecha_final = fecha + (new_params[:duracion].to_i * 60)
      fecha_final
    end  
end
