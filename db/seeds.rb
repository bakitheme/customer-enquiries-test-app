User.create!(name: 'Denis',
             email: 'denis@gmail.com',
             password: 'foobar',
             password_confirmation: 'foobar')

TicketCategory.create!(category_name: 'Setup Problem')
TicketCategory.create!(category_name: 'Technical Problems')
TicketCategory.create!(category_name: 'Service')
TicketCategory.create!(category_name: 'Hardwere Problem')
TicketCategory.create!(category_name: 'Softwere Problem')
TicketCategory.create!(category_name: 'Miscellaneous')

TicketStatus.create!(status_name: 'Waiting for Staff Response',
                     color: 'primary')
TicketStatus.create!(status_name: 'Waiting for Customer',
                     color: 'info')
TicketStatus.create!(status_name: 'On Hold',
                     color: 'secondary')
TicketStatus.create!(status_name: 'Cancelled',
                     color: 'danger')
TicketStatus.create!(status_name: 'Completed',
                     color: 'success')

25.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  subject = Faker::Lorem.sentence(word_count: 3)
  content = Faker::Lorem.sentence(word_count: 20)
  status = rand(1..5)
  category = rand(1..6)
  reference = Ticket.generate_reference
  Ticket.create!(client_name: name,
                 client_email: email,
                 ticket_category_id: category,
                 ticket_status_id: status,
                 subject: subject,
                 content: content,
                 reference: reference,
                 activated: true,
                 activated_at: Time.zone.now)
end
