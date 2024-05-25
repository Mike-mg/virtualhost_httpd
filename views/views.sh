title_menu () {
    # Show title menu
    echo -e "\n"
    title_text="$@"
    echo -e $title_text
    for i in `seq ${#title_text}`; do echo -n "#";done
    echo -e "\n"
}

sub_title () {
    # Show sub title menu
    sub_title="$@"
    echo -e "> $sub_title"
}