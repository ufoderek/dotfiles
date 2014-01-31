if [ -z "$3" ]; then
    echo "grep-kernel.sh mt6592 acer92_we_jb9 PATTERN"
else
    for i in kernel mediatek/kernel mediatek/platform/$1/kernel mediatek/custom/common/kernel mediatek/custom/$1/kernel mediatek/custom/$2/kernel; do
        grep -rni $3 $i
    done
fi
