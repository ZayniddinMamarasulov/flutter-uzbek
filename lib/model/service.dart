class Infor{
  String information;
  String imageUrl;
  String iconUrl;
  String text;
  String name;
  String batafsil;

  Infor(this.name,this.imageUrl,this.iconUrl,this.text,this.information,this.batafsil);

  static List<Infor> infor=[
    Infor('John Deo','assets/icons/img5.png','assets/icons/image9.png',
        'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices lectus in pellentesque'
            ' elit dui. Urna ultrices tellus varius scelerisque suspendisse pellentesque. Quam vitae vel,'
            ' feugiat consequat a massa mi. Dolor a integer aliquet orci quam nibh id tortor morbi.'),
    Infor('John Deo', 'assets/icons/person1.png', 'assets/icons/image9.png', 'Lorem ipsum dolor sit amet',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit...', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
            ' Ultrices lectus in pellentesque elit dui. Urna ultrices tellus varius scelerisque suspendisse pellentesque.'
            ' Quam vitae vel, feugiat consequat a massa mi. Dolor a integer aliquet orci quam nibh id tortor morbi.')

  ];


}