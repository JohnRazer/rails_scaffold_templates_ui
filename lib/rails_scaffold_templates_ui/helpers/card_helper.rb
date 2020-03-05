module CardHelper

  def default_options
    return {:id => 'modal', :size => '', :show_close => true,
            :dismiss => true, :head => ''}
  end

  # wrap content with card
  # @param options possible values:
  #   head  fill the card heading
  #   id    set the card id
  #
  def card(options={}, &block)
    opts = default_options.merge(options)

    content_tag :div, :id => opts[:id], :class => "card card-info" do
      content_tag(:div, :class => "card-heading") do
        content_tag(:div, :class => "card-heading-btn") do
          raw %{
          <a class="btn btn-xs btn-icon btn-circle btn-warning" data-click="card-collapse"><i class="fa fa-minus"></i></a>
          }
        end +
        content_tag(:h4, :class => "card-title") do
          opts[:head]
        end
      end +
      content_tag(:div, :class => "card-body", &block)
    end
  end

end
