require "rails_helper"

RSpec.describe TicketMailer, type: :mailer do
  describe "ticket_activation" do
    let(:mail) { TicketMailer.ticket_activation }

    it "renders the headers" do
      expect(mail.subject).to eq("Ticket activation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
