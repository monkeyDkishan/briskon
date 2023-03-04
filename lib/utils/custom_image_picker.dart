part of utils;

class CustomImagePicker {
  XFile? imageFile;
  Uint8List? imgBytesData;

  final _picker = ImagePicker();

  Function(String)? onFile;
  Function(bool)? onLoading;
  Function(String)? onError;

  bool isLoading = false;

  selectImage(BuildContext context) {
    bottom(context);
  }

  bottom(BuildContext context){

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context, builder: (context){

      return PickImageSheet(onCameraClick: (){
        Navigator.pop(context);
        pick(ImageSource.camera);
      },onGalleryClick: (){
        Navigator.pop(context);
        pick(ImageSource.gallery);
      });

    });

  }

  setIsLoading(bool isLoading){
    if(onLoading != null){
      this.isLoading = isLoading;
      onLoading!(isLoading);
    }
  }

  updateFileWithPath(XFile file){
    if(onFile != null){
      onFile!(file.path);
    }
  }

  onErrorCall(String error){
    if(onError != null){
      onError!(error);
    }
  }

  pick(ImageSource source) async {
    setIsLoading(true);
    try {
      final image = await _picker.pickImage(source: source,imageQuality: 80);

      if (image != null){
        imageFile = image;
        updateFileWithPath(image);
        imgBytesData = await image.readAsBytes();
      }

    } catch (e) {
      onErrorCall(e.toString());
    } finally {
      setIsLoading(false);
    }
  }

}

class PickImageSheet extends StatelessWidget {
  const PickImageSheet({Key? key, required this.onCameraClick, required this.onGalleryClick}) : super(key: key);

  final Function onCameraClick;
  final Function onGalleryClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
      ),
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [

              const Text("Select Image From?",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  InkWell(
                    onTap: (){
                      onCameraClick();
                    },
                    child: Column(
                      children: const [
                        Icon(Icons.camera_alt_rounded,size: 60),
                        Text("Camera",style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),)
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      onGalleryClick();
                    },
                    child: Column(
                      children: const [
                        Icon(Icons.image,size: 60),
                        Text("Gallery",style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),)
                      ],
                    ),
                  )

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}



