#[derive(Drop)]
struct Rectangle {
    length: u32,
    height: u32
}

fn main() {
    let mut arr1: Array<u32> = array![1, 2];
    let arr2 = @arr1;

    arr1.append(3);

    println!("length of original array is: {}", arr1.len());
    println!("length of snapshot array is: {}", arr2.len());

    let mut rec = Rectangle { length: 10, height: 20 };
    let area = cal_rect_area(@rec);

    println!("Area of the rectangle is: {}", area);

    flip(ref rec)
}

fn cal_rect_area(rec: @Rectangle) -> u32 {
    *rec.height * *rec.length
}

fn flip(ref rec: Rectangle) {
    rec.length = 200;
    println!("{}", rec.length);
}
