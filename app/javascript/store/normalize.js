import { camelizeKeys } from 'humps'
import { normalize, schema } from 'normalizr'

const product = new schema.Entity('products')
const category = new schema.Entity('categories')
const error = new schema.Entity('errors')
const order = new schema.Entity('orders')
const orderProduct = new schema.Entity('orderProducts')
const account = new schema.Entity('accounts')
const currentUser = new schema.Entity('currentUsers')
const address = new schema.Entity('addresses')
const pushMessage = new schema.Entity('pushMessages')

export const normalizeEntities = (storeProps) =>
  normalize(camelizeKeys(storeProps), {
    accounts: [account],
    products: [product],
    categories: [category],
    orders: [order],
    errors: [error],
    orderProducts: [orderProduct],
    currentUsers: [currentUser],
    addresses: [address],
    pushMessages: [pushMessage],
})
