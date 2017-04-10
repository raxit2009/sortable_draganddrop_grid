1) Add below gem in your gem file

	gem 'jquery-ui-rails'
	gem 'rails_sortable'

2) Bundle install

3) Add javascript asset

	add below code 

		//= require jquery-ui
		//= require rails_sortable

	In below sequence

		//= require jquery
		//= require jquery_ujs
		//= require jquery-ui
		//= require rails_sortable
		//= require turbolinks
		//= require_tree .

4) Add migration with sort field in which table you want to add sorting 
	
	In my example i add sort field in posts table

	rails g migration add_sort_in_posts

	and don't forgot to add 

	add_column :posts, :sort, :integer

	In Migration file

	Than after run rake db:migrate

5) Edit your controller file 

	add sort field in strong parameter like below mention
	
	I add it in my posts_controller.rb
	
		def post_params
      		params.require(:post).permit(:title, :body, :sort)
    	end

6) Edit your sortable model
	
	Add below two line in your model
	
	In my example i want sorting in posts model so i add on post.rb

	include RailsSortable::Model
  	set_sortable :sort 

7) Add sort field in your form 

	like i add sort field in my post form ( In my example post/_form.html.erb)

	<div class="field">
    	<%= f.label :sort %><br>
    	<%= f.text_field :sort %>
  	</div>

8)  Change in your table body

	Here i change in post/index.html.erb


	<tbody class="sortable">
	    <% sortable_fetch(@posts) do |post,id_tag| %>
	      <tr id="<%= id_tag %>">
	        <td><%= post.title %></td>
	        <td><%= post.sort %></td>
	        <td><%= post.body %></td>
	        <td><%= link_to 'Show', post %></td>
	        <td><%= link_to 'Edit', edit_post_path(post) %></td>
	        <td><%= link_to 'Destroy', post, method: :delete, data: { confirm: 'Are you sure?' } %></td>
	      </tr>
	    <% end %>
	</tbody>
