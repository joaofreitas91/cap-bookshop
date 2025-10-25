import cds from '@sap/cds'

class BookshopService extends cds.ApplicationService {
    async init() {
        this.before('CREATE', "Books", (req) => {
            if (req.data.price < 0) {
                req.error(400, 'O preço do livro não pode ser negativo.');
            }
        });

        this.after("each", "Books", async (book) => {
            book.title = book.title?.toUpperCase()
        })


        this.after("READ", "Orders", async (orders) => {
            const orderIds = orders.map(order => order.ID);
            const orderItemsWithBooks = await SELECT.from(
                "OrderItems",
                orderItem => {
                    orderItem.ID, orderItem.order_ID, orderItem.quantity,
                        orderItem.book(book => {
                            book.ID, book.title, book.price
                        })
                })
                .where({ order_ID: { in: orderIds } })

            if (!orderItemsWithBooks.length) return


            const groupedItems = orderItemsWithBooks.reduce((acc, item) => {
                (acc[item.order_ID] ??= []).push(item);
                return acc;
            }, {});



            for (const order of orders) {
                const selectedItem = groupedItems[order.ID] ?? [];
                const sumBooks = selectedItem.reduce((sum, orderItem) => {
                    return sum + (orderItem.book?.price ?? 0) * (orderItem.quantity ?? 1)
                }, 0);

                order.totalValue = sumBooks;
            }
        })

        this.on('totalAvailableBooks', async () => {
            const availableBooks = await SELECT.from("Books").where({ available: true })
            return availableBooks.length;
        });

        this.on('applyDiscount', async (req) => {
            const { bookID, percent } = req.data;

            if (!bookID || !percent) {
                return req.error(400, 'É necessário informar o ID do livro e o percentual de desconto.');
            }

            const book = await SELECT.one.from("Books").where({ ID: bookID })

            if (!book) return req.error(404, 'Livro não encontrado.');

            const newPrice = Math.floor(
                Math.max(0, book.price - (book.price * percent) / 100)
            );

            await UPDATE('Books')
                .set({ price: newPrice })
                .where({ ID: bookID });

            const updatedBook = await SELECT.one.from('Books').where({ ID: bookID });

            return updatedBook;

        });

        this.on('testeJean', asnc (req))

        super.init()
    }
}

export default BookshopService