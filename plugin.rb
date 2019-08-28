# frozen_string_literal: true

# name: discourse-prioritize-generic-onebox
# about: Prioritize generic onebox over Twitter card.
# version: 0.1
# authors: Arpit Jalan
# url: https://github.com/techAPJ/discourse-prioritize-generic-onebox

class Onebox::Engine::WhitelistedGenericOnebox
  def placeholder_html
    return article_html if is_article?
    return image_html if is_image?
    return Onebox::Helpers.video_placeholder_html if is_video?
    return Onebox::Helpers.generic_placeholder_html if is_embedded?
    to_html
  end

  private

  def generic_html
    return article_html  if is_article?
    return video_html    if is_video?
    return image_html    if is_image?
    return embedded_html if is_embedded?
    return article_html  if has_text?
    return card_html     if is_card?
  end
end
