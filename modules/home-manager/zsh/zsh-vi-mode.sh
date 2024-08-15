# Inspired by https://github.com/jeffreytse/zsh-vi-mode/issues/19#issuecomment-1915625381
my_zvm_vi_yank() {
  zvm_vi_yank
  echo -en "$CUTBUFFER" | wl-copy
}

my_zvm_vi_delete() {
  zvm_vi_delete
  echo -en "$CUTBUFFER" | wl-copy
}

my_zvm_vi_change() {
  zvm_vi_change
  echo -en "$CUTBUFFER" | wl-copy
}

my_zvm_vi_change_eol() {
  zvm_vi_change_eol
  echo -en "$CUTBUFFER" | wl-copy
}

my_zvm_vi_substitute() {
  zvm_vi_substitute
  echo -en "$CUTBUFFER" | wl-copy
}

my_zvm_vi_subsitute_whole_line() {
  zvm_vi_subsitute_whole_line
  echo -en "$CUTBUFFER" | wl-copy
}

my_zvm_vi_put_after() {
  CUTBUFFER="$(wl-paste)"
  zvm_vi_put_after
  zvm_highlight clear
}

my_zvm_vi_put_before() {
  CUTBUFFER="$(wl-paste)"
  zvm_vi_put_before
  zvm_highlight clear
}

my_zvm_vi_replace_selection() {
  CUTBUFFER="$(wl-paste)"
  zvm_vi_replace_selection
  echo -en "$CUTBUFFER" | wl-copy
}

zvm_after_lazy_keybindings() {
  zvm_define_widget my_zvm_vi_yank
  zvm_define_widget my_zvm_vi_delete
  zvm_define_widget my_zvm_vi_change
  zvm_define_widget my_zvm_vi_change_eol
  zvm_define_widget my_zvm_vi_put_after
  zvm_define_widget my_zvm_vi_put_before
  zvm_define_widget my_zvm_vi_substitute
  zvm_define_widget my_zvm_vi_subsitute_whole_line
  zvm_define_widget my_zvm_vi_replace_selection

  zvm_bindkey vicmd 'C' my_zvm_vi_change_eol
  zvm_bindkey vicmd 'S' my_zvm_vi_subsitute_whole_line
  zvm_bindkey vicmd 'P' my_zvm_vi_put_before
  zvm_bindkey vicmd 'p' my_zvm_vi_put_after

  zvm_bindkey visual 'p' my_zvm_vi_replace_selection
  zvm_bindkey visual 'c' my_zvm_vi_change
  zvm_bindkey visual 'd' my_zvm_vi_delete
  zvm_bindkey visual 's' my_zvm_vi_substitute
  zvm_bindkey visual 'x' my_zvm_vi_delete
  zvm_bindkey visual 'y' my_zvm_vi_yank
}

