module Jekyll
    module Tags
        class AccordionTag < Liquid::Block
            def initialize( tag_name, block_options, liquid options)
                super
                @accordionID = "accordion-#{block_options.strip}"
            end # initialize() function

            def render( context )
                context.stack do
                    context["accordionID"] = @accordionID
                    context["collapsed_idx"] = 1
                    @content = super
                end # context.stack

                output = %(<div class="accordion" id="#{@accordionID}">#{@content}</div>)

            end # render() function

        end # AccordionTag class

    end # Tags module

end # Jekyll module 

Liquid::Template.register_tag('accordion', Jekyll::Tags::AccordionTag)