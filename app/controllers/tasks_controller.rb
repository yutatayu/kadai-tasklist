class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end
    
    def show
        @tasks = Task.find(param[:id])
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
            flash[:success] = "タスクが正常に投稿されました"
            redirect_to @task
        else
            flash.now[:danger] = "タスクが投稿されませんでした"
            render :new
        end
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def task_params
        params.require(:task).permit(:content)
    end
end
