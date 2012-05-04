class RepliesController < ApplicationController
  before_filter :load_topic
  
  def load_topic
    @topic = Topic.find(params[:topic_id])
  end
  
  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @replies }
    end
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
    @reply = Reply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reply }
    end
  end

  # GET /replies/new
  # GET /replies/new.json
  def new
    @reply = @topic.replies.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reply }
    end
  end

  # GET /replies/1/edit
  def edit
    @reply = @topic.replies.find(params[:id])
  end

  # POST /replies
  # POST /replies.json
  def create
    @reply = @topic.replies.build(params[:reply])

    respond_to do |format|
      if @reply.save
        format.html { redirect_to([Forum.find(@topic.forum_id), @topic]), notice: 'Reply was successfully created.' }
        format.json { render json: @reply, status: :created, location: @reply }
      else
        format.html { render action: "new" }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /replies/1
  # PUT /replies/1.json
  def update
    @reply = @topic.replies.find(params[:id])

    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        format.html { redirect_to @topic, notice: 'Reply was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply = @topic.replies.find(params[:id])
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to(@topic)}
      format.json { head :no_content }
    end
  end
end
