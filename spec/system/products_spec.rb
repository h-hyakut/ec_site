require 'rails_helper'

RSpec.describe "Products", type: :system do
  describe "GET /products/:id" do
    it "renders product_path(id)" do
      book = FactoryBot.create(:book)
      visit product_path(book.id)
      click_link "Order"
      expect(page).to have_text(book.title)
      expect(page).to have_button("Proceed to the next step.")
    end
  end

  describe "POST /orders" do
    it "renders products_path" do
      book = FactoryBot.create(:book)
      visit product_path(book.id)
      click_link "Order"
      expect(page).to have_text(book.title)
      
      fill_in "order_count", with: 1
      fill_in "order_address", with: "福岡県"
      click_button "Proceed to the next step."
      
      expect(current_path).to eq confirm_orders_path
      expect(page).to have_text(book.title)
      expect(page).to have_text("1")
      expect(page).to have_text("福岡県")

      click_button "Confirm your order."

      expect(current_path).to eq complete_orders_path
      expect(page).to have_text ("☁️ Thank you!☺ Your order has been completed.🐈🐾+.*")
    end
  end
end