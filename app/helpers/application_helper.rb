module ApplicationHelper
    def full_title(page_title = '')
        base_title = "Branding"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end
    

def qrcode_tag(text, options = {})
    ::RQRCode::QRCode.new(text).as_svg(options).html_safe
end

        
end
