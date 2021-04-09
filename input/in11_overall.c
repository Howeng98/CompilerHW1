float c = 1.5;

bool loop(int n, int m) {
    while (n > m) {
        n--;
    }
    for (;;) {
        if (n < m) {
            break;
        }
    }
    return true;
}

void v_v() {
    return;
}

int main() {
    // Declaration
    /* this is a comment // line with some and C delimiters */
    int x;
    int i;
    int a = 5;
    string y_y = "She is a \"girl\"";

    print(y_y); // print
    // this is a comment // line */ /* with /* delimiters */ before the end

    // if condition
    if (a > 10 && a != 15) {
        x += a;
        print(x);
    } else {
        x = a % 10 + 10 * 7; /* Arithmetic */
        print(x);
    }

    for (i = 0; i < x; i++) {
        if (i == 4) {
            continue;
        }
        prin(i); /* comment
            newline
            %^#&!#&@%&^%#&*@%
        */
    }
    print("Hello World");

    return 0;
}