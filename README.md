# crm_utils

A new Flutter project.

## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  crm_utils: any
```

## Responsive Grid / Grid System
Example: [`example.dart`](https://github.com/ChandraHemant/crm_utils/blob/main/example/lib/main.dart)

Grid system is very important when you create some web application. Especially for create responsive layout. This plugin is help to solve it

To create responsive layout you must using widget `CRMRow` and `CRMCol` or if in bootstrap use class="row" and class="col-*"

Create row container of grid system:
```dart
CRMRow(
  gutter: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
  children: <CRMCol>[
    // ...
  ]
);
```

After that you can add column:
```dart
CRMRow(
//...
    children: <CRMCol>[
      CRMCol(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        padding: EdgeInsets.all(20.0),
        sizes: ColScreen(sm: Col.col_12, lg: Col.col_6),
        child: Center(child: Text('col-sm-12 col-lg-6')),
      ),
      CRMCol(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        visibility: CRMVisibility.hiddenMd,
        padding: EdgeInsets.all(20.0),
        sizes: ColScreen(sm: Col.col_12, lg: Col.col_6),
        child: Center(child: Text('col-sm-12 col-lg-6 col-hidden-md')),
      ),
      CRMCol(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        padding: EdgeInsets.all(20.0),
        sizes: ColScreen(sm: Col.col_12, md: Col.col_12, lg: Col.col_6),
        order: ColOrder(md: 1),
        child: Center(child: Text('col-sm-12 col-md-12 col-md-6 col-order-lg-1')),
      ),
      CRMCol(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        sizes: ColScreen(md: Col.col_6),
        child: CRMRow(
          children: [
            CRMCol(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              padding: EdgeInsets.all(10.0),
              sizes: ColScreen(md: Col.col_4),
              child: Center(child: Text('Nested col-md-4')),
            ),
            CRMCol(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              padding: EdgeInsets.all(10.0),
              sizes: ColScreen(md: Col.col_4),
              offset: ColScreen(lg: Col.col_4),
              child: Center(child:Text('Nested col-md-4 col-offset-lg-4')),
            ),
          ],
        ),
      ),
    ] 
// ...
)
```
#### Note
- Properties `sizes` in `CRMCol` is has default value `Col.col_12` or 100% of screen width
- If need to ordering column use properties `order` with value `CRMScreen`
- If need to custom offset of column use properties `offet` with value `CRMScreen`
- `CRMVisibility.hiddenMd` will hide widget in max screen medium or < 768 px, above it will show


After create controller:

```dart
// ...
  CRMSelectBoxController _select1 = CRMSelectBoxController(
    options: [
      CRMSelectBoxOption(value: 1, text: Text('1')),
      CRMSelectBoxOption(value: 2, text: Text('2')),
      CRMSelectBoxOption(value: 3, text: Text('3')),
    ]
  );
// ...
```

After all is done copy the code below:

```dart
// ...
  CRMSelectBox(
    hintText: 'Select One',
    selectBoxController: _select1,
  ),
// ...
```


If you need to customize size and style, use properties `style` and `size`. And create your custom size with class `CRMSelectBoxSize` or `CRMSelectBoxStyle` to custom style

```dart
  static const CRMSelectBoxSize customSize = CRMSelectBoxSize(
    fontSize: 14.0,
    optionFontSize: 14.0,
    searchInputFontSize: 14.0,
    labelX: 15.0,
    labelY: 13.0,
    transitionLabelX: -15.0,
    transitionLabelY: 5.0,
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 12.0, bottom: 12.0)
  );
```

```dart
  static const CRMSelectBoxStyle outline = CRMSelectBoxStyle(
    borderRadius: BorderRadius.all(Radius.circular(5.0))
  );
```

### Note
- `labelX` and `labelY` is used to set label position if using `hintTextLabel`
- `transitionLabelX` and `transitionLabelY` is used to set label position if using `hintTextLabel` when have selected value
- `CRMSelectBoxStyle` have properties `borderRadius`, `color`, `placeholderColor`, `selectedBackgroundColor`, `selectedColor`, `disabledBackgroundColor`, `backgroundColor`, `borderColor`, `fontSize`, `arrowIcon`

## Select Box Style 2 (hintTextLabel)

Select box using `hintTextLabel`
```dart
// ...
  CRMSelectBox(
    hintTextLabel: 'Select One',
    selectBoxController: _select1,
  ),
// ...
```

## Select Box Multiple

To create a select box with multiple allowed set `multiple` properties in `CRMSelectBoxController` to true:

```dart
// ...
  CRMSelectBoxController _select2 = CRMSelectBoxController(
    multiple: true,
    options: [
      CRMSelectBoxOption(value: 1, text: Text('1')),
      CRMSelectBoxOption(value: 2, text: Text('2')),
      CRMSelectBoxOption(value: 3, text: Text('3')),
      CRMSelectBoxOption(value: 4, text: Text('4')),
      CRMSelectBoxOption(value: 5, text: Text('5')),
      CRMSelectBoxOption(value: 6, text: Text('6')),
    ]
  );
// ...
```

### Note
- To get selected value use `getSelected` or `getSelectedAll`
- If you need returned string use `getSelectedAsString`, it will be returned string value with `,` separator
- To set selected value use `setSelected` or `setSelectedAll`

## Select Box Server Side

To create a select box with server side data, use `serverSide` property

```dart
  CRMSelectBox(
    hintText: 'Select One',
    searchable: true,
    selectBoxController: _select3,
    serverSide: selectApi,
  )
```

### Note
- To enable searchable option, set `searchable` property `true`
- `serverSide` property need returned `Future<CRMSelectBoxResponse>`

`selectApi` function
```dart
// ...
  Future<CRMSelectBoxResponse> selectApi(Map<String, String> params) async {
    Uri url = Uri.http('localhost', 'api-json.php', params);
    Response response = await http.get(url);
    if(response.statusCode == 200) {
      List json = convert.jsonDecode(response.body);
      return CRMSelectBoxResponse.createFromJson(json);
    }

    return CRMSelectBoxResponse(options: []);
  }
// ...
```

Json response data
```json
[
  {
    "value":"1",
    "text":"Tipe 01",
    "typecd":"TP01"},
  {
    "value":"2",
    "text":"Type 02",
    "typecd":"TP02"
  }
]
```

### Note
- `createFromJson` is automatically put response data `value`, but you cant change it with define manual
- If you want to make `typecd` as `value` of option, use `value` parameters of `createFromJson`

```dart
/// ...
    if(response.statusCode == 200) {
      List json = convert.jsonDecode(response.body);
      return CRMSelectBoxResponse.createFromJson(json, 
        value: (data) => data['typecd'],
      );
    }
/// ...
```

- If you want to make `typecd` as `text` of option, use `renderText` parameters of `createFromJson`
- `renderText` function need returned `Widget`

```dart
/// ...
    if(response.statusCode == 200) {
      List json = convert.jsonDecode(response.body);
      return CRMSelectBoxResponse.createFromJson(json, 
        value: (data) => data['typecd'],
        renderText: (data) => Text(data['typecd'])
      );
    }
/// ...
```

Modal will be show using `showDialog`, because `CRMModal` is a `Dialog` widget

```dart
// ...
  CRMButton(
    style: CRMButtonStyle.primary,
    margin: EdgeInsets.only(right: 5.0, bottom: 10.0),
    label: Text('Centered Small Modal with No Radius'),
    onPressed: () => showDialog(context: context, builder: (context) => CRMModal(
      context: context,
      dialog: CRMModalDialog(
        size: CRMModalSize.sm,
        crossAxisAlignment: crossAxisAlignment.center,
        child: CRMModalContent(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          children: [
            CRMModalContainer(title: Text('Content'), closeButton: true),
            CRMModalContainer(
              child: Column(
                  children: [
                    Text('Content')
                  ]
              ),
            ),
            CRMModalContainer(
              crossAxisAlignment: CrossAxisAlignment.end,
              actions: [
                CRMButton(
                  style: CRMButtonStyle.danger,
                  label: Text('Close Modal'),
                  prefixIcon: Icons.close,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    )),
  )
// ...
```

#### Note
- `CRMModalDialog` is backdrop layout
- `CRMModalContent` is content from modal
- `CRMModalContainer` is children from `CRMModalContent`
- Change `size` properties to change modal size
- `CRMModalContainer` can be use as modal-header, modal-body and modal-footer
- To set `CRMModalContent` to centered, you can modify `crossAxisAlignment` on `CRMModalDialog` properties