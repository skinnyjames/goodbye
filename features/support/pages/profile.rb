class Profile
  include PageObject

  divs(:posts, id: /^jumper_/)
  button(:confirm_delete, { class: 'layerConfirm' })

  def delete_everything
    while posts_elements.select{|els| els.children.length > 0 }.size > 0
      delete(posts_elements.select{|els| els.children.length > 0 }.first)
    end
  end

  def delete(post)
    post.scroll.to :center
    post.a(css: 'a[aria-label="Story options"]').wait_until(&:present?).click

    positioners = browser.divs(class: 'uiContextualLayerPositioner').reject do |div| 
      div.class_name =~ /hidden_elem/ 
    end
    
    links = positioners.first.div(class: 'uiContextualLayer').wait_until(&:present?).lis

    delete_link = links.select{|link| link.text =~ /Hide\sfrom\stimeline/}
    delete_link.first.click
    confirm_delete_element.wait_until(&:present?).click
    post.button(title: 'Close').wait_until(&:present?).click
    browser.scroll.to :bottom
    sleep 8
  end
end
