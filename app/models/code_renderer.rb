class CodeRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    p language
    Pygments.highlight(code, :lexer => language)
  end
end
