fn main () {
    let x = 5;
    let x = x + 5;
    {
        //x here will start as 10 from outer scope then become 100 on computation
        let x = x * 10;
        println!("inner value of x is {}", x);
    }
    //x here ignores the inner scope
    println!("new value of x is: {}", x);
}