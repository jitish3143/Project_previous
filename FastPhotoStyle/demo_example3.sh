mkdir images -p && mkdir results -p;
rm images/content3.png -rf;
rm images/style3.png -rf;
rm results/content3_seg.pgm -rf;
rm results/style3_seg.pgm -rf;
rm results/stylization_with_auto_segmentation.png -rf;
export PYTHONPATH=$PYTHONPATH:segmentation
# cd images;
# axel -n 1 https://pre00.deviantart.net/f1a6/th/pre/i/2010/019/0/e/country_road_hdr_by_mirre89.jpg --output=content3.png;
# axel -n 1 https://nerdist.com/wp-content/uploads/2017/11/Stranger_Things_S2_news_Images_V03-1024x481.jpg --output=style3.png;
# convert -resize 50% content3.png content3.png;
# convert -resize 50% style3.png style3.png;
# cd ..;

for a in `seq 41 104`
do 
	echo $a;

# -=0-19 full size
# 20 - 70 70% size
  # convert -resize 80% train_new/im$a.png train_new/im$a.png;
  # convert -resize 80% train_new/tar$a.png train_new/tar$a.png;
  # #--no_post
	python demo_with_ade20k_ssn.py  --no_post  --content_image_path train_new/im$a.png --style_image_path train_new/tar$a.png --content_seg_path results/content-$a-seg.pgm --style_seg_path results/style-$a-seg.pgm --output_image_path results/out$a.png
done



# python demo_with_ade20k_ssn.py   --content_image_path train_new/im1.png --style_image_path train_new/i1.jpg --content_seg_path post_train_results_new/content-11-seg.pgm --style_seg_path post_train_results_new/style-11-seg.pgm --output_image_path post_train_results_new/out-PhotoWCT-111-SEG.png

# python demo_with_ade20k_ssn.py --content_image_path d1/im5.png --style_image_path d1/tar6.png --content_seg_path results/content-6-seg.pgm --style_seg_path results/style-6-seg.pgm --output_image_path results/out-PhotoWCT-SEG-6.png
# # done


# parser.add_argument('--content_seg_path', default='./results/content3_seg.pgm')
# parser.add_argument('--style_image_path', default='./images/style3.png')
# parser.add_argument('--style_seg_path', default='./results/style3_seg.pgm')

# python demo_with_ade20k_ssn.py;
