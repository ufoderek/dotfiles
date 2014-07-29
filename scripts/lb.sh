declare -A wk0=( [pname]=Mango [wname]=mw  [bname]=a1-810_ww_gen1 [sname]=acer89_tb_mwf_kk   [sec]=true)
declare -A wk1=( [pname]=Mango [wname]=mg  [bname]=a1-811_ww_gen1 [sname]=acer89_tb_m3g_kk   [sec]=true)
declare -A wk2=( [pname]=S3    [wname]=s3  [bname]=s53_twn_gen1s  [sname]=acer92_lwt_kk      [sec]=true)
declare -A wk3=( [pname]=Prada [wname]=pd  [bname]=a5810_ww_gen1  [sname]=acer92_tb_prada_kk [sec]=false)
declare -A wk7=( [pname]=A10   [wname]=a10 [bname]=s510_ww_gen1   [sname]=acer89_we_kk       [sec]=true)

declare -a wks=( wk0 wk1 wk2 wk3 wk4 wk5 wk6 wk7 )
declare -a wki=( a b c jba jbb ma mb mtk )

#lazy build.sh
if [ -n "$1" ]; then

    for wk in "${wks[@]}"; do
        for i in "${wki[@]}"; do
            tmp_wname=$wk[wname]
            tmp_bname=$wk[bname]
            tmp_sname=$wk[sname]

            dir_name=${!tmp_wname}.$i.git
            sku_name=${!tmp_sname}
            build_name=${!tmp_bname}

            sku_path=${HOME}/wk/${dir_name}/mediatek/config/${sku_name}
            current_path=`pwd`/mediatek/config/${sku_name}

            #lazy build
            if [ "${sku_path}" = "${current_path}" ]; then
                if [ "$1" = "u" ] || [ "$1" = "user" ]; then
                    variant="user"
                elif [ "$1" = "ud" ] || [ "$1" = "userdebug" ]; then
                    variant="userdebug"
                else
                    variant="eng"
                fi
                if [ "$2" = "d" ] || [ "$1" = "dist" ]; then
                    dist="-d"
                else
                    dist=""
                fi
                ./build.sh -s ${build_name} -v ${variant} ${dist}
                #echo "${build_name} ${variant} ${dist} ${sku_path}"
                exec $0
                exit 0
            fi
        done
    done
#update links for Flash Tool
else

    out_base=${HOME}/wk/dl

    if [ ! -d ${out_base} ]; then
        mkdir -p ${out_base}
    fi
    #if [ ! -L ${out_base}/pandora ]; then
    #    ln -s ${HOME}/wk/tmp/win ${out_base}/pandora
    #fi

    for wk in "${wks[@]}"; do
        for i in "${wki[@]}"; do
            tmp_wname=$wk[wname]
            tmp_sname=$wk[sname]
            tmp_sec=$wk[sec]

            dir_name=${!tmp_wname}.$i.git
            sku_name=${!tmp_sname}
            sec_state=${!tmp_sec}

            if [ "${sec_state}" = "true" ]; then
                out_dir=${!tmp_wname}.$i.sout
                out_dist_dir=${!tmp_wname}.$i.dist
                img_path=${HOME}/wk/${dir_name}/out/target/product/${sku_name}/signed_bin
                dist_path=${HOME}/wk/${dir_name}/out/dist
            else
                out_dir=${!tmp_wname}.$i.out
                out_dist_dir=${!tmp_wname}.$i.dist
                img_path=${HOME}/wk/${dir_name}/out/target/product/${sku_name}
                dist_path=${HOME}/wk/${dir_name}/out/dist
            fi 

            out_path=${out_base}/${out_dir}
            out_dist_path=${out_base}/${out_dist_dir}

            if [ -d ${out_path} ]; then
                rm ${out_path}
            fi
            if [ -d ${out_dist_path} ]; then
                rm ${out_dist_path}
            fi

            #create new link if img_path exists
            if [ -d ${img_path} ]; then
                ln -s ${img_path} ${out_path}
            fi
            if [ -d ${dist_path} ]; then
                ln -s ${dist_path} ${out_dist_path}
            fi
        done
    done
    ls ${out_base}
fi
