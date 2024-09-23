use core::dict::Felt252Dict;

#[derive(Destruct)]
struct Point {
    // val1: u32,
    // val2: u32,
    val3: Felt252Dict<u32>
}

#[derive(Destruct)]
struct Point2 {
    lav1: Felt252Dict<u32>
}

// fn foo(mut arr: Array<u128>) {
//     arr.pop_front();
// }

fn main() {
    // let mut arr: Array<u128> = array![];
    // let point1 = Point {val1: 4, val2: 5};

    Point { val3: Default::default() };
    Point2 { lav1: Default::default() };
    // foo(point1);
// foo(point1);
}
// fn foo(p:Point) {

// }

