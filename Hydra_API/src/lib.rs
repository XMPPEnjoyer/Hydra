pub fn add(left: usize, right: usize) -> usize {
    left + right
}
#[cfg(hapi)]
mod hapi {
    use super::*;

    #[hapi]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
