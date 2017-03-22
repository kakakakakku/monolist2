class RankingController < ApplicationController

  def have
    @haves = Have
              .group(:item_id)
              .order('count_item_id DESC')
              .limit(10)
              .count(:item_id)
    @items = Item
              .where(id: @haves.keys)
              .sort_by{|item| @haves.keys.index(item.id)}
  end

  def want
    @wants = Want
              .group(:item_id)
              .order('count_item_id DESC')
              .limit(10)
              .count(:item_id)
    @items = Item
              .where(id: @wants.keys)
              .sort_by{|item| @wants.keys.index(item.id)}
  end

end
