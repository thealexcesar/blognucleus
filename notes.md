## routes

```ruby
# Adicione a rota post para criar comentario no post.
resources :posts do
  post 'create_comment', on: :collection
end
```

## Controller

```ruby
def show
  @comment = @post.comments.new
  puts "comment_teste#{@post.comments.new.inspect}"
  @comments = Comment.where(post_id: @post).order("created_at ASC")
end
```

```ruby
def create
  @post = Post.new(post_params)

  respond_to do |format|
    if @post.save
      format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
      format.json { render :show, status: :created, location: @post }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
end
```

```ruby
# abaixo do post_params PRIVADO
def comment_params
  params.require(:comment).permit(:name, :body, :post_id)
end
```

```ruby
# Adicione ➱ create_comment no before_action
before_action :set_post, only: [ :show, :edit, :update, :create_comment, :destroy ]
```

-----



## Views

### Crie uma partial para visualizar os comentarios e outra para criar novo comentario (ou faça numa partial so)

- renderize a partial no arquivo: **show.html.erb**
```erb
	<%= render 'posts/partials/comments', comments: @comments %>
	<%= render 'posts/partials/new_comment' %>
````
----

- posts/partials/comments.html.erb
```erb
	<% if comments.count > 0
		comments.each do |comment|
  	%>
    <div class="row mt20 margin-nil">
      <div class="chat-discussion chat-discussion-support">
        <div class="chat-message">
          <div class="message">
            <a class="message-author" href="#"> <%= comment.name %> </a>
            <span class="message-date"> <%= comment&.created_at </span>
            <span class="message-content"> <%= comment&.body %> </span>
          </div>
        </div>
      </div>
    </div>
  <%
    end
  end
  %>
```

## posts/partials/new_comment.html.erb

```erb
<div id="support_status_updated" class="row">
  <div class="col-xs-12 form-group">
    <div class="form-group" style="margin-bottom:0;">
      <h3>Teste novo comenteario</h3>
      <%= form_for(@comment, url: create_comment_posts_path, html: { class: "", role: "form", method: "post"}) do |f| %>
        <%= f.hidden_field :post_id, value: @post.id %>

        <div class="form-group">
          <label>Comentario</label>
        <%= f.text_area :body, class: "form-control", placeholder: "comentario" %>
        </div>
        <div class="form-group">
          <label>Nome</label>
          <%= f.text_area :name, class: "form-control", placeholder: "nome" %>
        </div>

        <div class="form-group">
          <%= f.submit class: "btn btn-sm btn-primary pull-right m-t-n-xs", value: "Salvar" %>
        </div>
        <div class="clearfix"></div>
        <br><br>
      <% end %>
    </div>
  </div>
</div>

```
----

Todo:

### Admin
- [ ] Tela de login
- [ ] Gerenciamento de usuários (CRUD de users)
- [ ] Gerenciamento do blog (CRUD de posts)

### Frontend do blog
- [x] Todas as noticias
- [ ] Busca por titulo da noticia
- [x] Comentarios na noticia
- [ ] (Admin) pode excluir o comentario

[link admin template](https://athemes.com/collections/free-bootstrap-admin-templates/)
