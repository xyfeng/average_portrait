# Average Portrait
Uses openCV and dlib to automatically align portraits in python, average the portraits using processing & p5.js [ [p5 Demo](http://xyfeng.github.io/average_portrait/) ]

![portrait animation](https://raw.githubusercontent.com/xyfeng/average_portrait/master/result_animation.gif "portrait animation")

Portrait Average

![portrait average](https://raw.githubusercontent.com/xyfeng/average_portrait/master/result_average.png "portrait average")

Portrait Swap

![portrait swap](https://raw.githubusercontent.com/xyfeng/average_portrait/master/result_swap.jpg "swap")

Portrait Detection

![portrait detection](https://raw.githubusercontent.com/xyfeng/average_portrait/master/result_detection.png "portrait detection")

## How to Use
- Download [landmarks](http://sourceforge.net/projects/dclib/files/dlib/v18.10/shape_predictor_68_face_landmarks.dat.bz2)
- Unzip it and move to `landmarks` folder
- Face Align `python face_align.py image_folder image_format reference_image_path`
- Face Detection `python face_detection.py image_folder`
- Face Swap `python face_swap.py original_portrait.jpg new_portrait.jpg`
- Generating Image Metadata CSV `exiftool -csv -FileSize -ImageWidth -ImageHeight image_folder/*.jpg > metadata.csv`

## Examples
Face Align

```
python face_align.py portraits/ jpg portraits/01a4462309f79052d1a480170ef3d7ca7bcbd564.jpg
```

Generate Image Metadata CSV

```
// change directory
cd processing/average_portraits/data/
// scan images and generate metadata csv
exiftool -csv -FileSize -ImageWidth -ImageHeight ../../../result_align/*.jpg  > metadata.csv
```

Face Detection

```
python face_detection.py portraits/
```

Face Swap

```
python face_swap.py portraits/01a4462309f79052d1a480170ef3d7ca7bcbd564.jpg portraits/838ba61ea8d3fd1ff15d9549314e251f95ca5f68.jpg
```

## References
- [Face Swap](http://matthewearl.github.io/2015/07/28/switching-eds-with-python/) by Matthew Earl
- [ExifTool](http://www.sno.phy.queensu.ca/~phil/exiftool/) by Phil Harvey
- Portraits from [BaiKe](http://baike.baidu.com/view/27362.htm)

## Install OpenCV and Dlib
Install pip

```
sudo easy_install pip
```

Install cmake

```
// download binary
https://cmake.org/download/
// install command line tool from application menu
Tools->How To Install For Command Line Use
```

Install homebrew

```
ruby -e "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/master/install](https://raw.githubusercontent.com/Homebrew/install/master/install))"
```

Install boost

```
brew install boost --with-python
```

Install boost-python

```
brew install boost-python
```

Install numpy

```
sudo pip install numpy
```

Install dlib

```
sudo pip install dlib
```

Install openCV [Reference](http://www.mobileway.net/2015/02/14/install-opencv-for-python-on-mac-os-x/)

```
brew tap homebrew/science
// opencv installation will be located at: /usr/local/Cellar/opencv/2.4.10/
brew install opencv
cat ~/.bash_profile | grep PYTHONPATH
ln -s /usr/local/Cellar/opencv/2.4.12/lib/python2.7/site-packages/cv.py cv.py
ln -s /usr/local/Cellar/opencv/2.4.12/lib/python2.7/site-packages/cv2.so cv2.so
```

Install skimage [ OPTIONAL ]

```
sudo pip install -U scikit-image
```

Install ExifTool

```
// download command line tool
http://www.sno.phy.queensu.ca/~phil/exiftool/
```
