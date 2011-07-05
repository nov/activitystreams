module ActivityStreams
  class Stream < Collection
    attr_required :items

    def item_class
      Activity
    end
  end
end