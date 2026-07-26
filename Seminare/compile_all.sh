function get_number {
    local number=$1
    if [ "$number" -lt 10 ]; then
        echo "0$number"
    else
        echo "$number"
    fi
}

for i in {1..15}; do
    num=$(get_number $i)
    echo "Compiling Seminar $num"
    typst compile "./Seminar $num/main.typ" "./Seminar $num/Seminar $num.pdf"
    echo "Finished Seminar $num"
    echo ""
done

# typst compile "./Seminar 01/main.typ" "./Seminar 01/Seminar 01.pdf"
