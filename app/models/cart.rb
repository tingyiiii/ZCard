# PORO = Plain Old Ruby Object
class Cart

  def initialize(items = [])
    @items = items
  end

  def add_item(item_id, quantity = 1)
    # 判斷
    found_item = @items.find{ |item| item.item_id == item_id }
    if found_item
      # 增加數量
      found_item.increment(quantity)
    else
      # 給一個新的CartItem
      @items << CartItem.new(item_id, quantity)
    end
  end

  def empty?
    @items.empty?
  end

  def items
    @items
  end

  def total_price
    total = @items.reduce(0) do |sum, item|
      sum + item.total_price
    end

    total = total * 0.9 if Date.today.month == 12 && Date.today.day == 25

    total
  end

  def serialize
    items = @items.map {|item| { "item_id" => item.item_id, "quantity" => item.quantity}}
    

    # 用each方法
    # @items.each do |item|
    #   items <<  { "item_id" => item.item_id, "quantity" => item.quantity}
    # end
    
    # 原本的樣子
    # [
    #   { "item_id" => 1, "quantity" => 3},
    #   { "item_id" => 2, "quantity" => 2}
    # ]

    { "items" => items }
  end

  def self.from_hash(hash)
    if hash && hash["items"]
      items = hash["items"].map do |item|
        CartItem.new(item["item_id"], item["quantity"])
      end
      Cart.new(items)
    else
      Cart.new
    end
  end

end