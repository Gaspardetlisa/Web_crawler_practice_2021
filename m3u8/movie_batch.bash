echo -n "請輸入影片名稱:"
read fname
rm -r ~/Desktop/$fname/m3u8
echo -n "請輸入開始集數:"
read var
echo -n "請輸入結束集數:"
read var2
for ((i=$var;i<=$var2;++i));
do
	if [ `echo "$i < 10"|bc` -eq 1 ];then
		cd $fname/$fname"0"$i
		cat *.ts > $fname.ts
		ffmpeg -i $fname.ts -vcodec copy -acodec copy $fname"0"$i.mp4
		mv $fname"0"$i.mp4 ~/Desktop/$fname/
		cd ..
		rm -r $fname"0"$i	
		cd ..
	else
		cd $fname/$fname$i
		cat *.ts > $fname.ts		
		ffmpeg -i $fname.ts -vcodec copy -acodec copy $fname$i.mp4
		mv $fname$i.mp4 ~/Desktop/$fname/
		cd ..
		rm -r $fname$i	
		cd ..
	fi
done