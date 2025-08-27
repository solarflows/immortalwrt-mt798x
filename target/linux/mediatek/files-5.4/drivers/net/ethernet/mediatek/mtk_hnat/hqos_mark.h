#ifndef _HQOS_MARK_H
#define _HQOS_MARK_H

/* MTK QDMA QoS Marking Scheme
 * We use bits 16-23 of skb->mark for application-specific queue mapping
 * This avoids conflicts with other subsystems using lower bits (0-15)
 */

/* Bitmask for our QoS field in skb->mark (bits 16-23) */
#define MTK_QOS_MARK_MASK          (0x00FF0000)

/* Shift value to extract our QoS value from skb->mark */
#define MTK_QOS_MARK_SHIFT         (16)

/* Maximum value we can store in our 8-bit field */
#define MTK_QOS_MARK_MAX           (0xFF)

/* Macro to extract queue ID from skb->mark */
#define MTK_QOS_GET_MARK(mark)     (((mark) & MTK_QOS_MARK_MASK) >> MTK_QOS_MARK_SHIFT)

#endif /* _HQOS_MARK_H */
