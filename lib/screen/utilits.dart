import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Screen {
  Size screenSize;

  Screen._internal();

  Screen(this.screenSize);

  double wp(percentage) {
    return percentage / 100 * screenSize.width;
  }

  double hp(percentage) {
    return percentage / 100 * screenSize.height;
  }

  double getWidthPx(int pixels) {
    return (pixels / 3.61) / 100 * screenSize.width;
  }
}

Color colorCurve =Colors.blue;
Color colorCurveSecondary = Colors.blueAccent;
Color backgroundColor =Colors.grey.shade200;
Color textPrimaryColor =Colors.black87;

//textColors
Color textPrimaryLightColor = Colors.white;
Color textPrimaryDarkColor = Colors.black;
Color textSecondaryLightColor = Colors.black87;
Color textSecondary54 = Colors.black54;
Color textSecondaryDarkColor = Colors.blue;
Color hintTextColor = Colors.white30;
Color bucketDialogueUserColor = Colors.red;
Color disabledTextColour = Colors.black54;
Color placeHolderColor = Colors.black26;
Color dividerColor = Colors.black26;

class Property{
  String id;
  String propertyName;
  String propertyPrice;
  String propertyDesc;
  String propertyLocation;
  String image;
  String map;
  int counter=0;

  Property({this.id, this.propertyName, this.propertyPrice, this.propertyDesc,this.image,this.propertyLocation,this.map});


}

class BoxField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final Key key;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final IconData icon;
  final Color iconColor;
  final Color focusBorderColor;
  final String hintText;
  final String lableText;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Color defaultBorderColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  final FormFieldSetter<String> onSaved;

  const BoxField({
    this.key,
    this.controller,
    this.focusNode,
    TextInputType keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.icon,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.maxLines = 1,
    this.maxLength,
    this.onSaved,
    this.hintText,
    this.lableText,
    this.maxLengthEnforced = true,
    this.onChanged,
    this.defaultBorderColor,
    this.onEditingComplete,
    this.onSubmitted,
    this.iconColor,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.focusBorderColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.validator,
    this.onFieldSubmitted,
  })  : assert(textAlign != null),
        assert(autofocus != null),
        assert(obscureText != null),
        assert(autocorrect != null),
        assert(maxLengthEnforced != null),
        assert(maxLines == null || maxLines > 0),
        assert(maxLength == null || maxLength > 0),
        keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline);

  @override
  _BoxFieldState createState() => _BoxFieldState();
}

class _BoxFieldState extends State<BoxField> {
  double width;
  double height;
  Color focusBorderColor =  Colors.grey.shade400;
  FocusNode _focusNode = FocusNode();
  ValueChanged<Colors> focusColorChange;

  Screen size;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    size = Screen(MediaQuery.of(context).size);
    return  Container(
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: height / 400),
                padding: EdgeInsets.all(size.getWidthPx(0)),
                alignment: Alignment.center,
                height: size.getWidthPx(40),
                decoration:  BoxDecoration(
                    color: Colors.grey.shade100,
                    border:  Border.all(color: widget.focusBorderColor??Colors.grey.shade400, width: 1.0),
                    borderRadius:  BorderRadius.circular(8.0)),
                child:  TextFormField(
                  key: widget.key,
                  style: TextStyle(fontFamily: 'Exo2'),
                  obscureText: widget.obscureText,
                  controller: widget.controller,
                  onSaved: widget.onSaved,
                  validator: widget.validator,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  decoration:  InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        widget.icon,
                        color: widget.iconColor,
                        size: size.getWidthPx(22),
                      ),
                      hintText: widget.hintText),
                ),
              )),
        ],
      ),
      padding: EdgeInsets.only(bottom :size.getWidthPx(8)),
      margin: EdgeInsets.only(top: size.getWidthPx(8), right: size.getWidthPx(8), left:size.getWidthPx(8)),
    );
  }
}


class HorizontalList extends StatefulWidget {
  final List<Widget> children;
  final ScrollPhysics scrollPhysics;

  const HorizontalList({Key key, this.children, this.scrollPhysics}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  Screen size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);

    return Container(
      padding: EdgeInsets.all(size.getWidthPx(4)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        child: Row(
          children: widget.children,
        ),
      ),
    );
  }
}


class VerticalList extends StatefulWidget {
  final List<Widget> children;
  final ScrollPhysics scrollPhysics;

  const VerticalList({Key key, this.children, this.scrollPhysics}) : super(key: key);

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  Screen size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);

    return Container(
      padding: EdgeInsets.all(size.getWidthPx(4)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: widget.children,
        ),
      ),
    );
  }
}

class UpperClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height/1.5);

    var firstEndPoint = Offset(size.width, size.height/1.5);
    var firstControlPoint = Offset(size.width/2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;


}

class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0.0, size.height / 1.75);

    var firstControlPoint = Offset(10, size.height * .95);
    var firstEndPoint = Offset(size.width / 2, size.height * .95);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 1.25, size.height * .95);
    var secondEndPoint = Offset(size.width - 20, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;


}

class GradientText extends StatelessWidget {
  GradientText(this.data,
      {@required this.gradient,
        this.style,
        this.textAlign = TextAlign.left});

  final String data;
  final Gradient gradient;
  final TextStyle style;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: Text(
        data,
        textAlign: textAlign,
        style: (style == null)
            ? TextStyle(color: Colors.white)
            : style.copyWith(color: Colors.white),
      ),
    );
  }
}
