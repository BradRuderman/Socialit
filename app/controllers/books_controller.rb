class BooksController < ApplicationController
  include BooksHelper

  # GET /books
  # GET /books.json
  def index
    @books = get_books()
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create

  end

  def add
    @book = get_book(params[:pearson_id])
    b = Book.new
    b.pearson_id = @book["book"]["id"]
    b.title = @book["book"]["title"]
    @book["book"]["authors"].each do |a|
      Rails.logger.info a["full_name"].to_s
      b.author = b.author.to_s + a["full_name"].to_s + ","
    end
    b.author = b.author.chomp(",")
    covers = ["taleoftwocities.jpg","barchestertowers.jpg","cranford.jpg", "daisymiller.jpg","danielderonda.jpg","davidcopperfield.jpg","davidthorne.jpg","dracula.jpg", "dubliners.jpg", "emma.jpg", "evelina.jpg", "farfromthemaddingcrowd.jpg"]
    b.image_url = covers[params[:cover_id].to_i]
    current_user.books.push(b)
    #current_user.books.add(b)
    #current_user.save!
    respond_to do |format|
      if b.save!
        format.html { redirect_to '/books', notice: 'Book was successfully created.' }
        format.json { render json: '/books', status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: '/books', status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end
end
