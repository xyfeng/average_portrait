# Average Portrait
Uses openCV and Dlib to automatically align portraits in python, average the portraits using p5.js

## How to Use
- Download [landmarks](http://sourceforge.net/projects/dclib/files/dlib/v18.10/shape_predictor_68_face_landmarks.dat.bz2)
- Unzip it and move to `landmarks` folder
- Face Align `python face_align.py image_folder image_format reference_image_path`
- Face Detection `python face_detection.py image_folder`
- Face Swap `python face_swap.py original_portrait.jpg new_portrait.jpg`

## Examples
Face Align

```
python face_align.py portraits/ jpg portraits/21a4462309f79052d1a480170ef3d7ca7bcbd564.jpg
```

Face Detection

```
python face_detection.py portraits/
```

Face Swap

```
python face_swap.py portraits/21a4462309f79052d1a480170ef3d7ca7bcbd564.jpg portraits/838ba61ea8d3fd1ff15d9549314e251f95ca5f68.jpg
```

## References
- [Face Swap](http://matthewearl.github.io/2015/07/28/switching-eds-with-python/) by Matthew Earl
- Portraits from [BaiKe](http://baike.baidu.com/view/27362.htm)

## Install OpenCV and Dlib
Install pip

```
sudo easy_install pip
```

Install cmake

```
[https://cmake.org/download/](https://cmake.org/download/)
(Menu->Tools->How To Install For Command Line Use)
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

Install opencv

```
brew tap homebrew/science
brew install opencv (opencv installation will be located at: /usr/local/Cellar/opencv/2.4.10/)
cat ~/.bash_profile | grep PYTHONPATH
ln -s /usr/local/Cellar/opencv/2.4.10/lib/python2.7/site-packages/cv.py cv.py
ln -s /usr/local/Cellar/opencv/2.4.10/lib/python2.7/site-packages/cv2.so cv2.so
Reference:[http://www.mobileway.net/2015/02/14/install-opencv-for-python-on-mac-os-x/](http://www.mobileway.net/2015/02/14/install-opencv-for-python-on-mac-os-x/)
```

Install skimage [ OPTIONAL ]

```
sudo pip install -U scikit-image
```
