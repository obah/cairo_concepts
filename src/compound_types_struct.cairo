#[derive(Copy, Drop)]
struct Point {
    x: u32,
    y: u32,
}

#[derive(Drop, PartialEq)]
struct Rectangle {
    width: u64,
    height: u64
}

#[derive(Drop)]
struct Square {
    side: u64
}

#[derive(Copy, Drop, Debug)]
struct Rectangle2 {
    width: u64,
    height: u64
}

//this is like the function signature
// trait Rectangle2Trait {
//     fn area(self: @Rectangle2) -> u64;

//     fn perimeter(self: @Rectangle2) -> u64;
// }

//this inherits
#[generate_trait]
impl Rectangle2Impl of Rectangle2Trait {
    fn area(self: @Rectangle2) -> u64 {
        (*self.width) * (*self.height)
    }

    fn perimeter(self: @Rectangle2) -> u64 {
        (*self.width + *self.height) * 2
    }

    fn scale(ref self: Rectangle2, factor: u64) {
        self.width *= factor;
        self.height *= factor;
    }

    fn can_hold(self: @Rectangle2, other_rect: @Rectangle2) -> bool {
        *self.width > *other_rect.width && *self.height > *other_rect.height
    }

    //this is an associated function
    fn sqaure(size: u64) -> Rectangle2 {
        Rectangle2 { width: size, height: size }
    }

    fn new(width: u64, height: u64) -> Rectangle2 {
        Rectangle2 { width, height }
    }

    fn avg(first_rect: @Rectangle2, second_rect: @Rectangle2) -> Rectangle2 {
        let new_height = (*first_rect.height + *second_rect.height) / 2;

        let new_width = (*first_rect.width + *second_rect.width) / 2;

        Rectangle2 { width: new_width, height: new_height }
    }
}

impl SquareIntoRect of Into<Square, Rectangle> {
    fn into(self: Square) -> Rectangle {
        Rectangle { width: self.side, height: self.side }
    }
}

fn main() {
    let mut p = Point { x: 1, y: 2 };
    let mut x = p.x;
    let mut y = p.y;
    x += 1;
    y += 1;
    println!("{} {}", p.x, p.y);

    let square = Square { side: 10 };

    let rectangle: Rectangle = square.into();
    let expectedRect = Rectangle { width: 10, height: 10 };

    assert!(rectangle == expectedRect, "A square is a rectangle with same width!");

    let mut rect2 = Rectangle2 { width: 30, height: 10 };
    println!("area of rect2 is {}", rect2.area());
    println!("perimeter of rect2 is {}", rect2.perimeter());

    rect2.scale(2);
    println!("the scaled rect2 is now width: {}, height: {}", rect2.width, rect2.height);

    let rect2a = Rectangle2 { width: 10, height: 2 };
    let rect2b = Rectangle2 { width: 100, height: 200 };

    let will_it_hold1: bool = rect2.can_hold(@rect2a);
    let will_it_hold2: bool = rect2.can_hold(@rect2b);

    println!("rect2 holding rect2a: {will_it_hold1}");
    println!("rect2 holding rect2b: {will_it_hold2}");

    let rect2c = Rectangle2Trait::new(10, 5);
    let rect2d = Rectangle2Trait::sqaure(10);

    let avg_rect = Rectangle2Trait::avg(@rect2c, @rect2d);

    println!("average rectangle of {:?} and {:?} is {:?}", rect2c, rect2d, avg_rect);
}
