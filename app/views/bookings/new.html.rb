<h1>New Booking Request</h1>
<br>
<%= simple_form_for [@pet, @booking] do |f| %>
  <%= f.date_field :start_date %>
  <%= f.date_field :end_date %>
  <%= f.submit "Submit booking request", class: "btn btn-primary" %>
<% end %>
