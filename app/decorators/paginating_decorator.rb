class PaginatingDecorator < Draper::CollectionDecorator
  delegate :prev_page, :next_page, :first_page?, :last_page?, :current_page
end
