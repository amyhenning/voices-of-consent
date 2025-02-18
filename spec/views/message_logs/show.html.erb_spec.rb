require 'rails_helper'

RSpec.describe "message_logs/show", type: :view do
  before(:each) do
    @messageable = create(:messageable)
    @sent_to = create(:user)
    @sent_by = create(:user)
    @message_log = create(
      :message_log,
      messageable: @messageable,
      content: "MyText",
      delivery_type: 3,
      delivery_status: "Delivery Status",
      sent_to: @sent_to,
      sent_by: @sent_by,
    )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/BoxRequest/)
    expect(rendered).to match(/#{@messageable.id}/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/#{MessageLog.delivery_types[1]}/)
    expect(rendered).to match(/Delivery Status/)
    expect(rendered).to match(/#{@sent_to.id}/)
    expect(rendered).to match(/#{@sent_by.id}/)
  end
end
