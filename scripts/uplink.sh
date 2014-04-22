declare -A wk0=( [pname]=Mango  [wname]=mw  [oname]=mango  [sname]=acer89_tb_mwf_kk      [sec]=true)
declare -A wk1=( [pname]=Mango  [wname]=mg  [oname]=mango  [sname]=acer89_tb_m3g_kk      [sec]=true)
declare -A wk2=( [pname]=S3     [wname]=s3  [oname]=s3     [sname]=acer92_lwt_kk         [sec]=false)
declare -A wk3=( [pname]=Prada  [wname]=pd  [oname]=prada  [sname]=acer92_tb_prada_kk    [sec]=false)
declare -A wk4=( [pname]=Mango  [wname]=mw  [oname]=mango  [sname]=acer89_tb_mwf_jb2     [sec]=true)
declare -A wk5=( [pname]=Mango  [wname]=mg  [oname]=mango  [sname]=acer89_tb_m3g_jb2     [sec]=true)

declare -a wks=( wk0 wk1 wk2 wk3 wk4 wk5 )
declare -a wki=( a b c jba jbb ma mb mtk )

out_base=${HOME}/dl

if [ ! -d ${out_base} ]; then
    mkdir -p ${out_base}
fi

if [ ! -L ${out_base}/pandora ]; then
    ln -s ${HOME}/wk/tmp/win ${out_base}/pandora
fi

for wk in "${wks[@]}"; do
    for i in "${wki[@]}"; do

        tmp_wname=$wk[wname]
        tmp_sname=$wk[sname]
        tmp_sec=$wk[sec]

        dir_name=${!tmp_wname}.$i.git
        sku_name=${!tmp_sname}
        sec_state=${!tmp_sec}

        if [ ${sec_state} == true ]; then
            out_dir=${!tmp_wname}.$i.sout
            img_path=${HOME}/wk/${dir_name}/out/target/product/${sku_name}/signed_bin
        else
            out_dir=${!tmp_wname}.$i.out
            img_path=${HOME}/wk/${dir_name}/out/target/product/${sku_name}
        fi

        out_path=${out_base}/${out_dir}

        #remove old link anyway
        #if [ -L ${out_path} ]; then
        #    rm ${out_path}
        #fi

        #create new link if img_path exists
        if [ -d ${img_path} ]; then
            ln -s ${img_path} ${out_path}
        fi
    done
done

